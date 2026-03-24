class CardProcessor:
    @staticmethod
    def process_cards(cards):
        processed_cards = []
        for card in cards:
            processed_card = {
                **CardProcessor.process_abilities(card),
                **CardProcessor.process_attacks(card),
                **CardProcessor.process_types(card),
                **CardProcessor.process_subtypes(card),
                **CardProcessor.process_rules(card),
                "name": card.name,
                "id": card.id,
                "supertype": card.supertype,
                "imageUrl": card.images.large,
                "set": card.set.name,
                "setSymbol": card.set.images.symbol,
                "setLogo": card.set.images.logo,
                "flavorText": card.flavorText
            }
            processed_cards.append(processed_card)
        return processed_cards

    @staticmethod
    def process_abilities(card):
        abilities = {
            "ability1Name": "",
            "ability1Text": "",
            "ability1Type": "",
            "ability2Name": "",
            "ability2Text": "",
            "ability2Type": ""
        }

        if hasattr(card, 'abilities') and card.abilities:  # Check if abilities exists and is not None
            if len(card.abilities) > 0:
                abilities["ability1Name"] = card.abilities[0].name
                abilities["ability1Text"] = card.abilities[0].text if hasattr(card.abilities[0], 'text') else ""
                abilities["ability1Type"] = card.abilities[0].type if hasattr(card.abilities[0], 'type') else ""
            if len(card.abilities) > 1:
                abilities["ability2Name"] = card.abilities[1].name
                abilities["ability2Text"] = card.abilities[1].text if hasattr(card.abilities[1], 'text') else ""
                abilities["ability2Type"] = card.abilities[1].type if hasattr(card.abilities[1], 'type') else ""

        return abilities

    @staticmethod
    def process_attacks(card):
        attacks = {}
        if hasattr(card, 'attacks') and card.attacks:  # Ensure attacks exists
            for i in range(4):
                attack_prefix = f"attack{i+1}"
                if len(card.attacks) > i:
                    attack = card.attacks[i]
                    cost = attack.cost if hasattr(attack, 'cost') and attack.cost else []
                    attacks.update({
                        f"{attack_prefix}Cost1": cost[0] if len(cost) > 0 else "",
                        f"{attack_prefix}Cost2": cost[1] if len(cost) > 1 else "",
                        f"{attack_prefix}Cost3": cost[2] if len(cost) > 2 else "",
                        f"{attack_prefix}Cost4": cost[3] if len(cost) > 3 else "",
                        f"{attack_prefix}Cost5": cost[4] if len(cost) > 4 else "",
                        f"{attack_prefix}Name": attack.name,
                        f"{attack_prefix}Text": attack.text if hasattr(attack, 'text') else "",
                        f"{attack_prefix}Damage": attack.damage if hasattr(attack, 'damage') else "",
                        f"{attack_prefix}ConvertedEnergyCost": attack.convertedEnergyCost if hasattr(attack, 'convertedEnergyCost') else 0
                    })
                else:
                    attacks.update({
                        f"{attack_prefix}Cost1": "",
                        f"{attack_prefix}Cost2": "",
                        f"{attack_prefix}Cost3": "",
                        f"{attack_prefix}Cost4": "",
                        f"{attack_prefix}Cost5": "",
                        f"{attack_prefix}Name": "",
                        f"{attack_prefix}Text": "",
                        f"{attack_prefix}Damage": "",
                        f"{attack_prefix}ConvertedEnergyCost": 0
                    })
        else:
            # If attacks is None or empty, set defaults
            for i in range(4):
                attack_prefix = f"attack{i+1}"
                attacks.update({
                    f"{attack_prefix}Cost1": "",
                    f"{attack_prefix}Cost2": "",
                    f"{attack_prefix}Cost3": "",
                    f"{attack_prefix}Cost4": "",
                    f"{attack_prefix}Cost5": "",
                    f"{attack_prefix}Name": "",
                    f"{attack_prefix}Text": "",
                    f"{attack_prefix}Damage": "",
                    f"{attack_prefix}ConvertedEnergyCost": 0
                })

        return attacks


    @staticmethod
    def process_types(card):
        types = {
            "type1": "",
            "type2": ""
        }

        if hasattr(card, 'types') and card.types:  # Check if types exists
            types["type1"] = card.types[0] if len(card.types) > 0 else ""
            types["type2"] = card.types[1] if len(card.types) > 1 else ""

        return types

    @staticmethod
    def process_subtypes(card):
        subtypes = {
            "subtype1": "",
            "subtype2": "",
            "subtype3": "",
            "subtype4": ""
        }

        if hasattr(card, 'subtypes') and card.subtypes:  # Check if subtypes exists
            subtypes["subtype1"] = card.subtypes[0] if len(card.subtypes) > 0 else ""
            subtypes["subtype2"] = card.subtypes[1] if len(card.subtypes) > 1 else ""
            subtypes["subtype3"] = card.subtypes[2] if len(card.subtypes) > 2 else ""
            subtypes["subtype4"] = card.subtypes[3] if len(card.subtypes) > 3 else ""


        return subtypes

    @staticmethod
    def process_rules(card):
        rules = {
            "rule1": "",
            "rule2": "",
            "rule3": "",
            "rule4": ""
        }

        if hasattr(card, 'rules') and card.rules:  # Check if rules exists and is a list
            rules["rule1"] = card.rules[0] if len(card.rules) > 0 else ""
            rules["rule2"] = card.rules[1] if len(card.rules) > 1 else ""
            rules["rule3"] = card.rules[2] if len(card.rules) > 2 else ""
            rules["rule4"] = card.rules[3] if len(card.rules) > 3 else ""

        return rules
