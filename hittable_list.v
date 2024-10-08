struct HitableList {
mut:
	list []Hitable
}

// Implements Hittable - return true if hit anything in the list
// and record the closest hit
fn (h HitableList) hit(r Ray, t_min f32, t_max f32, mut rec HitRecord) bool {
	mut temp_rec := new_hit_record()
	mut hit_anything := false
	mut closest_so_far := t_max

	for i := 0; i < h.list.len; i++ {
		if h.list[i].hit(r, t_min, closest_so_far, mut temp_rec) {
			hit_anything = true
			closest_so_far = temp_rec.t
			rec = temp_rec
		}
	}
	return hit_anything
}
