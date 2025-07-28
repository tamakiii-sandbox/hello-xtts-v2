.PHONY: help check-dependency clean

SHELL = bash --noprofile --norc -eo pipefail

help:
	@cat $(firstword $(MAKEFILE_LIST))

check-dependency:
	which tts

clean:
	rm -rf dist

dist/hello.wav: dist
	tts \
	  --text "Text for TTS" \
	  --model_name "tts_models/multilingual/multi-dataset/xtts_v2" \
	  --out_path $@ \
	  --speaker_idx 'Tammie Ema' \
	  --language_idx en

dist:
	mkdir -p $@
