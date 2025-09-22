from huggingface_hub import InferenceClient

client = InferenceClient(
    provider="nebius",
    api_key="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",
)

# Output is a PIL.Image object
image = client.text_to_image(
    "Astronaut riding a horse",
    model="black-forest-labs/FLUX.1-dev",
)

# Save the image to a file
image.save("astronaut_on_horse.png")