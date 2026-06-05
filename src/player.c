#include "player.h"

static uint8_t solid_at(int16_t px, int16_t py,
                        const uint8_t *map, uint16_t map_w, uint16_t map_h)
{
    if (px < 0 || py < 0 ||
        (uint16_t)px >= (map_w << 4) ||
        (uint16_t)py >= (map_h << 4))
        return 1; // out-of-bounds = solid (level edge)
    return IS_SOLID(col_point(px, py, map, map_w, map_h));
}

static uint8_t hazard_at(int16_t px, int16_t py,
                         const uint8_t *map, uint16_t map_w, uint16_t map_h)
{
    if (px < 0 || py < 0 ||
        (uint16_t)px >= (map_w << 4) ||
        (uint16_t)py >= (map_h << 4))
        return 0;
    return IS_HAZARD(col_point(px, py, map, map_w, map_h));
}

void player_init(Player *p, int16_t x, int16_t y)
{
    p->world_x = x;
    p->world_y = y;
    p->vel_y  = 0;
    p->on_ground = 0;
    p->dead = 0;
}

uint8_t player_update(Player *p, uint8_t joy,
                      const uint8_t *map,
                      uint16_t map_w, uint16_t map_h)
{
    if (p->dead) return 1;

    // ── Gravity ─────────────────────────────────────────────
    if (!p->on_ground) {
        p->vel_y += GRAVITY;
        if (p->vel_y > MAX_FALL) p->vel_y = MAX_FALL;
    }

    // ── Jump ─────────────────────────────────────────────────
    if ((joy & J_A) && p->on_ground) {
        p->vel_y = JUMP_FORCE;
        p->on_ground = 0;
    }

    // ── Vertical movement (8.8 sub-pixel stepping) ──────────
    int8_t pixels = (int8_t)(p->vel_y >> 4);
    int8_t step   = (pixels >= 0) ? 1 : -1;
    int8_t steps  = (pixels >= 0) ? pixels : -pixels;
    if (steps > 16) steps = 16;

    for (int8_t i = 0; i < steps; i++) {
        int16_t ny      = p->world_y + step;
        int16_t check_y = (step > 0) ? (ny + PLAYER_SIZE - 1) : ny;

        int16_t lx = p->world_x + PLAYER_HBOX;
        int16_t rx = p->world_x + PLAYER_SIZE - PLAYER_HBOX;

        if (solid_at(lx, check_y, map, map_w, map_h) ||
            solid_at(rx, check_y, map, map_w, map_h)) {
            // Snap to tile edge
            if (step > 0)
                p->world_y = (int16_t)((uint16_t)check_y - PLAYER_SIZE);
            else
                p->world_y = (int16_t)((uint16_t)check_y + 1);
            p->vel_y  = 0;
            p->on_ground = (step > 0);
            break;
        }

        p->world_y = ny;
    }

    // ── Horizontal movement (AABB wall slides) ──────────────
    {
        int8_t xmove = 0;
        if      (joy & J_LEFT)  xmove = -1;
        else if (joy & J_RIGHT) xmove =  1;

        if (xmove != 0) {
            int16_t nx  = p->world_x + xmove;
            int16_t top = p->world_y + 1;
            int16_t bot = p->world_y + PLAYER_SIZE - 2;
            int16_t lx  = nx + PLAYER_HBOX;
            int16_t rx  = nx + PLAYER_SIZE - PLAYER_HBOX;

            uint8_t wall_l = solid_at(lx, top, map, map_w, map_h) ||
                             solid_at(lx, bot, map, map_w, map_h);
            uint8_t wall_r = solid_at(rx, top, map, map_w, map_h) ||
                             solid_at(rx, bot, map, map_w, map_h);

            if (xmove < 0 && wall_l) {
                // Snap to right edge of tile (going left)
                p->world_x = (int16_t)((((uint16_t)lx >> 4) << 4) + 16 - PLAYER_HBOX);
            } else if (xmove > 0 && wall_r) {
                // Snap to left edge of tile (going right)
                p->world_x = (int16_t)((((uint16_t)rx >> 4) << 4) - PLAYER_SIZE + PLAYER_HBOX - 1);
            } else {
                p->world_x = nx;
            }

            // Clamp world_x to valid range to prevent signed-int overflow
            if (p->world_x < 0)    p->world_x = 0;
            if (p->world_x > 32767) p->world_x = 32767;
        }
    }

    // ── Hazard check (4-corner hbox) ────────────────────────
    {
        int16_t hx1 = p->world_x + PLAYER_HBOX;
        int16_t hx2 = p->world_x + PLAYER_SIZE - PLAYER_HBOX;
        int16_t hy1 = p->world_y + PLAYER_HBOX;
        int16_t hy2 = p->world_y + PLAYER_SIZE - PLAYER_HBOX;
        if (hazard_at(hx1, hy1, map, map_w, map_h) ||
            hazard_at(hx2, hy1, map, map_w, map_h) ||
            hazard_at(hx1, hy2, map, map_w, map_h) ||
            hazard_at(hx2, hy2, map, map_w, map_h)) {
            p->dead = 1;
            return 1;
        }
    }

    // ── Out-of-bounds (fell off screen) ──────────────────────
    if (p->world_y > (int16_t)((uint16_t)map_h << 4)) {
        p->dead = 1;
        return 1;
    }

    return 0;
}
