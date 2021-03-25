package org.springframework.cheapy.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cheapy.model.NuOffer;
import org.springframework.cheapy.repository.NuOfferRepository;
import java.util.Collection;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

@Service
public class NuOfferService {
	private NuOfferRepository nuOfferRepository;


	@Autowired
	public NuOfferService(final NuOfferRepository nuOfferRepository) {
		this.nuOfferRepository = nuOfferRepository;
	}

	public NuOffer findNuOfferById(final int id) {

		return this.nuOfferRepository.findNuOfferById(id);
	}
  	public List<NuOffer> findAllNuOffer() { //
		return this.nuOfferRepository.findAllNuOffer();

	}

	
	public void saveNuOffer(final NuOffer nuOffer) throws DataAccessException { //

		this.nuOfferRepository.save(nuOffer);

	}
}