function totalMassRollUp(instance,varargin)
% massRollUp: can be used for an instance analysis. The analysis is based
% on the stereotype property values of each component in the model.

if instance.isComponent()
   
    if ~isempty(instance.Components)
        mass = 0;
		for child=instance.Components
			if child.hasValue("MechanicalComponent.Mass")
            mass = mass + child.getValue("MechanicalComponent.Mass");
            elseif child.hasValue("ElectronicsComponent.Mass")
            mass = mass + child.getValue("ElectronicsComponent.Mass");
            elseif child.hasValue("Hardware.Mass")
            mass = mass + child.getValue("Hardware.Mass");
			end
		end
		if instance.hasValue("MechanicalComponent.Mass")
			instance.setValue("MechanicalComponent.Mass",mass);
        elseif instance.hasValue("ElectronicsComponent.Mass")
			instance.setValue("ElectronicsComponent.Mass",mass);
        elseif instance.hasValue("Hardware.Mass")
			instance.setValue("Hardware.Mass",mass);
		end
    end

end

end