/*
 * Copyright 2012-2019 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.springframework.cheapy.model;

import java.time.LocalDateTime;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@MappedSuperclass
public class Offer extends BaseEntity {

	private static final long	serialVersionUID	= 1L;

	// Clase padre

	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	@NotNull(message = "Debe introducir una fecha de inicio")
	private LocalDateTime		start;

	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	@NotNull(message = "Debe introducir una fecha de fin")
	private LocalDateTime		end;

	private String				code;

	@Enumerated(value = EnumType.STRING)
	private StatusOffer			status;

	@ManyToOne
	@JoinColumn(name = "client_id")
	private Client				client;


	public LocalDateTime getStart() {
		return this.start;
	}

	public void setStart(final LocalDateTime start) {
		this.start = start;
	}

	public LocalDateTime getEnd() {
		return this.end;
	}

	public void setEnd(final LocalDateTime end) {
		this.end = end;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(final String code) {
		this.code = code;
	}

	public StatusOffer getStatus() {
		return this.status;
	}

	public void setStatus(final StatusOffer type) {
		this.status = type;
	}

	public Client getClient() {
		return this.client;
	}

	public void setClient(final Client client) {
		this.client = client;
	}

	public Boolean isInactive() {
		Boolean res = false;
		if (this.status == StatusOffer.inactive) {
			res = true;
		}
		return res;
	}

}
