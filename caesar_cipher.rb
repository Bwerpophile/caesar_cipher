


# il faut comprendre la phrase DONE
# puis la comparer à l'array pour obtenir un numéro correspondant à la lettre,
# peut être utiliser Eachwithindex pour avoir l'index et la lettre
# puis ajouter 3 et recréer la phrase

def sentence_to_number(sentence) 
    alphabet = [*('a'..'z')]  # Liste des lettres minuscules
    alphabet_capitalize = [*('A'..'Z')]  # Liste des lettres majuscules
    sentence_split = sentence.chars  # Séparation de la phrase en caractères
    
    # Créer le hash d'alphabet avec l'index normal
    alphabet_hash = {}
    alphabet.each_with_index { |val, idx| alphabet_hash[val] = idx }
    alphabet_capitalize.each_with_index { |val, idx| alphabet_hash[val] = idx }
    
    # Appliquer le décalage de +3 sur l'index de chaque lettre
    array_sort = sentence_split.map do |char|
        # On vérifie si l'index est nil (caractère non présent dans alphabet_hash)
        index = alphabet_hash[char]
       
        if alphabet_hash.has_key?(char)
            index = alphabet_hash[char]  # Récupère l'index de la lettre
            new_index = (index + 3) % 26  # Applique le décalage de +3 et prend modulo 26 pour rester dans l'alphabet
            
        if char.match?(/[A-Z]/)
            new_char = alphabet_capitalize[new_index]  # Lettre majuscule
        else
            new_char = alphabet[new_index]
        end
            # Si ce n'est pas une lettre (caractère spécial ou espace), on garde le caractère tel quel
            [new_char].join() 
        else
            [char].join()
        end
      end
      array_sort.join() 
end

p sentence_to_number("hello World !")