local CacheItem = Class(function(self, inst)
	if not inst then return end

	self.prefab = inst.prefab
	self.components = {}

	if inst.components.edible then
		self.components.edible = {}
		self.components.edible.foodtype = inst.components.edible.foodtype
	end
end)

return CacheItem